import pygame
import random
from pygame.constants import QUIT, K_DOWN, K_UP, K_LEFT, K_RIGHT

HEIGHT = 800
WIDTH = 1200
COLOR_BLACK = (0, 0, 0)
FPS_SPEED = 500
ENEMY_INITIAL_PADDING = 50
BONUS_INITIAL_PADDING = 50

pygame.init()
FPS = pygame.time.Clock()
FONT = pygame.font.SysFont('verdana', 20)
main_display = pygame.display.set_mode((WIDTH, HEIGHT))

background = pygame.transform.scale(pygame.image.load('img/background.png'), (WIDTH, HEIGHT))
background_X1 = 0
background_X2 = background.get_width()
background_move = 3

player = pygame.image.load('img/player.png').convert_alpha()
player_size = (player.get_width(), player.get_height())
player_rect = pygame.Rect(0 , HEIGHT / 2, *player_size)
player_speed = [1, 1]
playing = True

player_move_up = [0, -4]
player_move_down = [0, 4]
player_move_left = [-4, 0]
player_move_right = [4, 0]

def create_enemy():
    enemy = pygame.image.load('img/enemy.png').convert_alpha()
    enemy_size = (enemy.get_width(), enemy.get_height())
    enemy_initial_y = random.randint(0 + ENEMY_INITIAL_PADDING, HEIGHT - ENEMY_INITIAL_PADDING)
    enemy_rect = pygame.Rect(WIDTH, enemy_initial_y, *enemy_size)
    enemy_move = [random.randint(-8, -4), 0]
    return [enemy, enemy_rect, enemy_move]

def create_bonus():
    bonus = pygame.image.load('img/bonus.png').convert_alpha()
    bonus_size = (bonus.get_width(), bonus.get_height())
    bonus_initial_y = random.randint(0 + BONUS_INITIAL_PADDING, WIDTH - BONUS_INITIAL_PADDING)
    bonus_initial_x = -bonus.get_height()
    bonus_rect = pygame.Rect(bonus_initial_y, bonus_initial_x, *bonus_size)
    bonus_move = [0, random.randint(4, 8)]
    return [bonus, bonus_rect, bonus_move]

CREATE_ENEMY = pygame.USEREVENT + 1
pygame.time.set_timer(CREATE_ENEMY, 1500)
enemies = []

CREATE_BONUS = pygame.USEREVENT + 2
pygame.time.set_timer(CREATE_BONUS, 1500)
bonuses = []

score = 0

while playing:
    FPS.tick(FPS_SPEED)

    for event in pygame.event.get():
        if event.type == QUIT:
            playing = False
        if event.type == CREATE_ENEMY:
            enemies.append(create_enemy())
        if event.type == CREATE_BONUS:
            bonuses.append(create_bonus())

    background_X1 -= background_move
    background_X2 -= background_move

    if background_X1 < -background.get_width():
        background_X1 = background.get_width()
    if background_X2 < -background.get_width():
        background_X2 = background.get_width()

    main_display.blit(background, (background_X1, 0))
    main_display.blit(background, (background_X2, 0))

    keys = pygame.key.get_pressed()

    if keys[K_UP] and player_rect.top > 0:
        player_rect = player_rect.move(player_move_up)
    if keys[K_DOWN] and player_rect.bottom < HEIGHT:
       player_rect = player_rect.move(player_move_down)
    if keys[K_LEFT] and player_rect.left > 0:
        player_rect = player_rect.move(player_move_left)
    if keys[K_RIGHT] and player_rect.right < WIDTH:
       player_rect = player_rect.move(player_move_right)

    for enemy in enemies:
        enemy[1] = enemy[1].move(enemy[2])
        main_display.blit(enemy[0], enemy[1])

        if player_rect.colliderect(enemy[1]):
            playing = False

    for bonus in bonuses:
        bonus[1] = bonus[1].move(bonus[2])
        main_display.blit(bonus[0], bonus[1])

        if player_rect.colliderect(bonus[1]):
            score += 1
            bonuses.pop(bonuses.index(bonus))

    main_display.blit(FONT.render(str(score), True, COLOR_BLACK), (WIDTH - 50, 20))
    main_display.blit(player, player_rect)
    pygame.display.flip()

    for enemy in enemies:
        if enemy[1].left < 0:
            enemies.pop(enemies.index(enemy))

    for bonus in bonuses:
        if bonus[1].bottom > HEIGHT:
            bonuses.pop(bonuses.index(bonus))
